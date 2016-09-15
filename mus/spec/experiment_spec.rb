 let (:experiment) { Experiment.create(project_admin_id: 1, title: "Mouse Hunt", hypothesis: "Finds cheese and eats cheese", summary: "Placing mouse in experimental maze with a prize of cheese", body: "The mouse is allergic to cheese and did not move") }

 describe "experiments" do
    describe "validations" do

      it "has a project admin" do
        expect(experiment.project_admin_id).to eq 1
      end

      it "has a title" do
        expect(experiment.title).to eq ('Mouse Hunt')
      end

      it "has a hypothesis" do
        expect(experiment.hypothesis).to eq ('Finds cheese and eats cheese')
      end

      it "has a summary" do
        expect(experiment.summary).to eq ('Placing mouse in experimental maze with a prize of cheese')
      end

      it "has a body" do
        expect(experiment.body).to eq ('The mouse is allergic to cheese and did not move')
      end
    end
  end