class HomeController < ApplicationController
  def index
    set_data
    @halls = Hall.first
    @columns = @halls.columns
    @rows = @halls.rows
    @diningtables = Diningtable.all
  end

  def show
    @petition = Petition.new
    @diningtables = Diningtable.all
    @waiters = Waiter.all
    @plates = Plate.all
    @diningtable = Diningtable.find_by position: (params[:position])
    # render json: @post
  end

  def update_state_order
    @diningtable = Diningtable.find_by position: (params[:position])
    @diningtable.update(state: 1)
    redirect_to show_path
  end

  def update_state_finalize
    @diningtable = Diningtable.find_by position: (params[:position])
    @diningtable.update(state: 0)
    redirect_to root_path
  end

  def set_data
    #si no tiene mozo
    waiters = Waiter.count
    if waiters == 0
      # Se creará un objeto mozo
      waiter = Waiter.new(name: "Mozo 1")
      waiter.save
    end
    #si no tiene sala
    halls = Hall.count
    if halls == 0
      # Se creará un objeto salón con 6 columnas y 3 filas, lo que da un total de 18 espacios
      hall = Hall.new(rows: 3, columns: 6)
      hall.save
    end
    # se obtiene el id del primer salón
    first_hall = Hall.first
    boxes = first_hall.rows * first_hall.columns
    #si no tiene mesas
    table = Diningtable.count
    if table == 0 && boxes >= 18
      # Se creararán objetos mesas y la posición indicará si el espacio (dentro de los 18) contiene una mesa o no
      table1 = Diningtable.new(position: 1, state: 0, hall_id: first_hall.id)
      table1.save
      table2 = Diningtable.new(position: 3, state: 0, hall_id: first_hall.id)
      table2.save
      table3 = Diningtable.new(position: 5, state: 0, hall_id: first_hall.id)
      table3.save
      table4 = Diningtable.new(position: 8, state: 0, hall_id: first_hall.id)
      table4.save
      table5 = Diningtable.new(position: 10, state: 0, hall_id: first_hall.id)
      table5.save
      table6 = Diningtable.new(position: 12, state: 0, hall_id: first_hall.id)
      table6.save
      table7 = Diningtable.new(position: 13, state: 0, hall_id: first_hall.id)
      table7.save
      table8 = Diningtable.new(position: 15, state: 0, hall_id: first_hall.id)
      table8.save
      table9 = Diningtable.new(position: 17, state: 0, hall_id: first_hall.id)
      table9.save
    end
  end
end
